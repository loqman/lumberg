module Lumberg
  module Whm
    class Database < Base
      # Public: Lists the server's database users.
      # This function does not accept parameters.
      def list_users(options = {})
        server.perform_request('list_database_users', options.merge(:"api.version" => 1, response_key: 'data'))
      end

      # Public: Lists the server's databases.
      # This function does not accept parameters.
      def list(options = {})
        server.perform_request('list_databases', options.merge(:"api.version" => 1, response_key: 'data'))
      end

      # Public: Changes a MySQL® database's name.
      # options - Hash options  for API call params (default: {}):
      # :oldname        - The database's current name.
      # :newname        - The database's new name.
      # :cpuser         - The database's owner.
      def rename_mysql_database(options = {})
        server.perform_request('rename_mysql_database', options.merge(:"api.version" => 1))
      end

      # Public: Changes a MySQL® database user's name.
      # options - Hash options  for API call params (default: {}):
      # :oldname        - The database user's current name.
      # :newname        - The database user's new name.
      # :cpuser         - The database user's owner.
      def rename_mysql_user(options = {})
        server.perform_request('rename_mysql_user', options.merge(:"api.version" => 1))
      end

      # Public: Changes a PostgreSQL database's name.
      # options - Hash options  for API call params (default: {}):
      # :oldname        - The database's current name.
      # :newname        - The database's new name.
      # :cpuser         - The database's owner.
      def rename_postgresql_database(options = {})
        server.perform_request('rename_postgresql_database', options.merge(:"api.version" => 1))
      end

      # Public: Changes a PostgreSQL database user's name.
      # options - Hash options  for API call params (default: {}):
      # :oldname        - The database user's current name.
      # :newname        - The database user's new name.
      # :cpuser         - The database user's owner.
      def rename_postgresql_user(options = {})
        server.perform_request('rename_postgresql_user', options.merge(:"api.version" => 1))
      end

      # Public: Changes a MySQL® database user's password.
      # options - Hash options  for API call params (default: {}):
      # :user           - Required, The account's username.
      # :password       - Required, The account's new password.
      # :cpuser         - The database user's owner.
      def set_mysql_password(options = {})
        server.perform_request('set_mysql_password', options.merge(:"api.version" => 1))
      end

    end
  end
end
