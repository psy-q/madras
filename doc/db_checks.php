<?php
/**
	 * check the capabilities of the db / db abstractor / db drivers
	 *
	 * @param string $database
	 * @param hmtfw_db_base $db
	 * @param array $msg_ar
	 */
	function check_capabilities_for_db($database, &$db, &$msg_ar) {
		$test_string_255=
			str_repeat('1234567890', 25).
			'12345' 
			;
		$test_string_4000=
			str_repeat('1234567890', 400)
			;
		$test_string_8000=
			str_repeat('1234567890', 800)
			;
		$checks=
			array(
				'test_empty_string' =>
					array(
						'clause' => $db->quote_string(''),
						'result' => '',
						'severity' => 'error',
					),
				'test_one_space' =>
					array(
						'clause' => $db->quote_string(' '),
						'result' => ' ',
						'severity' => 'error',
					),
				'test_num_0' =>
					array(
						'clause' => '0',
						'result' => '0',
						'severity' => 'error',
					),
					/*
				'test_num_0_plus_space' =>
					array(
						'clause' => $db->get_clause_concat(array('0', $db->quote_string(' '))),
						'result' => '0',
						'severity' => 'error',
					),
*/
				'test_space_plus_space' =>
					array(
						'clause' => $db->get_clause_concat(array($db->quote_string(' '), $db->quote_string(' '))),
						'result' => '  ',
						'severity' => 'error',
					),
				'test_space_plus_char_plus_space' =>
					array(
						'clause' => $db->get_clause_concat(array($db->quote_string(' '), $db->quote_string('0'), $db->quote_string(' '))),
						'result' => ' 0 ',
						'severity' => 'error',
					),
				'test_null' =>
					array(
						'clause' => "null",
						'result' => null,
						'severity' => 'error',
					),
				'test_char_plus_null' =>
					array(
						'clause' => $db->get_clause_concat(array($db->quote_string('1'), 'null')),
						'result' => null,
						'severity' => 'warn',
					),
				'test_0_plus_space' =>
					array(
						'clause' => $db->get_clause_concat(array($db->quote_string('0'), $db->quote_string(' '))),
						'result' => '0 ',
						'severity' => 'error',
					),					
				'test_date_now' =>
					array(
						'clause' => $db->get_clause_now(),
						'result_method' => 'check_cap_test_date_now',
						'severity' => 'error',
					),
				'test_date_empty' =>
					array(
						'clause' => $db->quote_string($db->get_empty_sqldate()),
						'result_method' => 'check_cap_test_date_empty',
						'severity' => 'error',
					),
				'test_computed_long_text_100K' =>
					array(
						'clause' => $db->get_function('repeat').'('.$db->get_clause_to_longtext($db->quote_string('1234567890')).', 10000)',
						'result_method' => 'check_cap_test_computed_long_text',
						'severity' => 'error',
						'custom_size' => 100000,
					),
				'test_computed_long_text_1MB' =>
					array(
						'clause' => $db->get_function('repeat').'('.$db->get_clause_to_longtext($db->quote_string('1234567890')).', 100000)',
						'result_method' => 'check_cap_test_computed_long_text',
						'severity' => 'error',
						'custom_size' => 1000000,
					),
				'test_computed_long_text_4MB' =>
					array(
						'clause' => $db->get_function('repeat').'('.$db->get_clause_to_longtext($db->quote_string('1234567890')).', 400000)',
						'result_method' => 'check_cap_test_computed_long_text',
						'severity' => 'warn',
						'custom_size' => 4000000,
					),
				'test_umlaute' =>
					array(
						'clause' => $db->quote_string('äöü'),
						'result' => 'äöü',
						'severity' => 'error',
					),
				'test_linebreaks' =>
					array(
						'clause' => $db->quote_string('a'.LF.'a'.CR.'a'.CRLF),
						'result' => 'a'.LF.'a'.CR.'a'.CRLF,
						'severity' => 'error',
					),
				'test_special_chars' =>
					array(
						'clause' => $db->quote_string('1\\\\2\\2\\n\\\\n'),
						'result' => '1\\\\2\\2\\n\\\\n',
						'severity' => 'error',
					),
				'test_varchar_255_cast' =>
					array(
						'clause' => 'cast('.$db->quote_string($test_string_255).' as varchar(255))',
						'result' => $test_string_255,
						'severity' => 'error',
					),
				'test_varchar_255' =>
					array(
						'clause' => $db->quote_string($test_string_255),
						'result' => $test_string_255,
						'severity' => 'error',
					),
				'test_varchar_8000_cast' =>
					array(
						'clause' => 'cast('.$db->quote_string($test_string_8000).' as varchar(8000))',
						'result' => $test_string_8000,
						'severity' => 'warn (not supported by mysql, but by mssql)',
					),
				'test_varchar_8000' =>
					array(
						'clause' => $db->quote_string($test_string_8000),
						'result' => $test_string_8000,
						'severity' => 'warn (not supported by mysql, but by mssql)',
					),
				'test_lowercase_accents_a' =>
					array(
						'clause' => 'lower(\'ÁÀÂÄÅÃ\')',
						'result' => strtolower('ÁÀÂÄÅÃ'), //'áàâäåã',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_e' =>
					array(
						'clause' => 'lower(\'ÉÈÊË\')',
						'result' => strtolower('ÉÈÊË'), // 'éèêë',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_i' =>
					array(
						'clause' => 'lower(\'ÍÌÎÏ\')',
						'result' => strtolower('ÍÌÎÏ'), // 'íìîï',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_o' =>
					array(
						'clause' => 'lower(\'ÓÒÔÖÕØ\')',
						'result' => strtolower('ÓÒÔÖÕØ'), // 'óòôöõø',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_u' =>
					array(
						'clause' => 'lower(\'ÚÙÛÜ\')',
						'result' => strtolower('ÚÙÛÜ'), // 'úùûü',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_c' =>
					array(
						'clause' => 'lower(\'Ç\')',
						'result' => strtolower('Ç'), // 'ç',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_n' =>
					array(
						'clause' => 'lower(\'Ñ\')',
						'result' => strtolower('Ñ'), //'ñ',
						'severity' => 'warn (some text matches may not match as intended)',
					),
				'test_lowercase_accents_y' =>
					array(
						'clause' => 'lower(\'Ý\')',
						'result' => strtolower('Ý'), //'ý',
						'severity' => 'warn (some text matches may not match as intended)',
					),
					
					/*
				'test_' =>
					array(
						'clause' => "",
						'result' => '',
						'severity' => 'error',
					),
*/
					
			);
		
				/*
				getdate() aktuelles_datum_plus_zeit,
				convert(varchar, getdate(), 104) aktuelles_datum_ch,
				convert(varchar, getdate(), 108) aktuelle_uhrzeit_ch,
				convert(datetime, '2006-03-29 17:15:59') datum_2006_03_29_17_15_59,
				convert(datetime, '1970-01-01 01:00:00') datum_1970_01_01_01_00_00
				*/

		// TODO: check for binary field support (e.g. binary varchar fields - case sensitive fields!)
			
			
		foreach ($checks as $test_label => $test) {
			$res= first_elem($db->query_and_fetch('select '.$test['clause'].' as test', '', array(), array( 'continue_on_error' => true, )));
			$result= $res['test'];
			if (something($test['result_method'])) {
				// verify test using a custom method
				$err_msg= call_user_func(array($this, $test['result_method']), $db, $result, $test);
				if (nothing($err_msg)) {
					$msg_ar[]= 'test "'.$test_label.'": passed';
				} else {
					$msg_ar[]= 
						'test "'.$test_label.'": '.important('failed: '.$err_msg).BR.
						'severity: '.$test['severity'].BR.
						'encountered: '.htmlspecialchars2(get_var_dump($result, false))
						;
				}
			} else {
				// simple test
				if ($result === $test['result']) {
					$msg_ar[]= 'test "'.$test_label.'": passed';
				} else {
					$msg_ar[]= 
						'test "'.$test_label.'": '.important('failed').BR.
						'severity: '.$test['severity'].BR.
						'expected: '.htmlspecialchars2(get_var_dump($test['result'], false)).BR.
						'encountered: '.htmlspecialchars2(get_var_dump($result, false))
						;
				}
			}
		}
		//$sql = "              SELECT '' f1, ' ' f2, 0 f3, 0 + ' ' f4, ' ' + ' ' f5, NULL f6, '1' + NULL f7, '0' + ' ' f8";
		
		/*
		 * 	"SELECT 
	

	";
		 */
	}
?>
