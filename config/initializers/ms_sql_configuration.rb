module ActiveRecord
  module ConnectionAdapters
    class SQLServerAdapter < AbstractAdapter

      def configure_connection
        raw_connection_do "set dateformat ymd;"
        raw_connection_do "set textsize 4096000;"
        raw_connection_do "set concat_null_yields_null on;"
        raw_connection_do "set ansi_nulls on;"
        raw_connection_do "set ansi_null_dflt_on on;"
        raw_connection_do "set ansi_padding on;"
        raw_connection_do "set ansi_warnings on;"
        raw_connection_do "set implicit_transactions off;"
        raw_connection_do "set quoted_identifier on;"
      end

    end
  end
end
