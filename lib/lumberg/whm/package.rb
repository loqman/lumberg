module Lumberg
  module Whm
    class Package < Base
      # Public: Retrieves a hosting plan's package extension templates
      #
      # options - Hash options for API call params (default: {}):
      #  :pkg        - A valid hosting plan name on the server.
      # Returns Hash API response.
      def get_extention_form(options = {})
        server.perform_request('_getpkgextensionform', options.merge(:"api.version" => 1))
      end

      # Public: Creates a hosting plan (package)
      #
      # options - Hash options  for API call params (default: {}):
      # :name                         - Required, The new hosting plan's name.
      # :fearurelist                  - The hosting plan's feature list.
      #                                 A valid feature list name on the server.
      #                                 If you do not use this parameter, the function
      #                                 assigns the default feature list to the account.
      # :quota                        - The hosting plan's disk space quota.
      #                                 A positive number between 0 and 999,999 in MiB
      #                                 This parameter defaults to 0 (unlimited).
      # :ip                           - Whether the account has a dedicated IP address.
      #                                 y(es)/n(o) The account has a dedicated IP address.
      # :cgi                          - Whether CGI access is enabled for the account.
      #                                 0/1 are possible values, 0 -> disabled, 1 -> enabled
      #                                 This parameter defaults to 1.
      # :frontpage                    - Whether Microsoft® FrontPage Extensions are enabled for the account.
      #                                 0/1 are possible values, 0 -> disabled, 1 -> enabled
      # :cpmod                        - The hosting plan's cPanel theme.
      #                                 x3 and paperlantern are default cpanel themes
      #                                 This parameter defaults to the server's default cPanel theme.
      # :language                     - The hosting plan's default locale.
      #                                 A two-letter ISO-3166 code.
      #                                 This value defaults to the server's default locale.
      # :maxftp                       - The hosting plan's maximum number of FTP accounts.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxsql                       - The hosting plan's maximum number of each available type of SQL database.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxpop                       - The hosting plan's maximum number of email accounts.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxlists                     - The hosting plan's maximum number of mailing lists.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxsub                       - The hosting plan's maximum number of subdomains.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxpark                      - The hosting plan's maximum number of parked domains.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :maxaddon                     - The hosting plan's maximum number of addon domains.
      #                                 A positive integer between one and 999,999.
      #                                 This parameter defaults to 0, unlimited.
      # :hasshell                     - Whether the account has shell access.
      #                                 0/1 are possible values, 0 -> disabled, 1 -> enabled
      #                                 This parameter defaults to 0.
      # :bwlimit                      - The hosting plan's maximum bandwidth use.
      #                                 A positive number between 0 and 999,999 in MiB
      #                                 This parameter defaults to 0, unlimited.
      # :MAX_EMAIL_PER_HOUR           - The maximum number of emails that the account can send in one hour.
      #                                 A positive integer.
      #                                 This parameter defaults to 0, unlimited.
      # :MAX_DEFER_FAIL_PERCENTAGE    - The percentage of failed or deferred email messages that
      #                                 the account can send per hour before outgoing mail is rate-limited.
      #                                 A positive integer.
      #                                 This parameter defaults to 0, unlimited.
      # :digestauth                   - Whether to enable Digest Authentication for accounts on the hosting plan.
      #                                 0/1 are possible values, 0 -> disabled, 1 -> enabled
      #                                 This parameter defaults to 0.
      # :_PACKAGE_EXTENSIONS          - The hosting plan's package extensions.
      #                                 A space-delimited list of one or more package extensions on the server.
      #                                 If you do not provide a value, the hosting plan will not include package extensions.
      def add
        server.perform_request('addpkg', options.merge(:"api.version" => 1))
      end

      # Public: Changes the hosting package associated with a cPanel account
      #
      #  :username      - Required, The cPanel account's username.
      #  :pkg           - Required, The hosting plan's name.
      def change_package(options = {})
        options[:user] = options.delete(:username)
        server.perform_request('changepackage', options.merge(:"api.version" => 1))
      end

      # Public: Edits a hosting plan (package).
      # parameter are all the same as add_package
      def edit(options = {})
        server.perform_request('editpkg', options.merge(:"api.version" => 1))
      end

      # Public: Lists a hosting plan's (package's) settings.
      # options - Hash options for API call params (default: {}):
      # :pkg      - The hosting plan's name.
      def get_info(options = {})
        server.perform_request('getpkginfo', options.merge(:"api.version" => 1))
      end

      # Public: Deletes a hosting plan (package).
      # options - Hash options for API call params (default: {}):
      # :pkg      - The hosting plan's name.
      def delete(options = {})
        server.perform_request('killpkg', options.merge(:"api.version" => 1))
      end

      # Public: Lists the available hosting plans (packages).
      # options - Hash options for API call params (default: {}):
      # This function does not accept parameters.
      def list(options = {})
        server.perform_request('listpkgs', options.merge(:"api.version" => 1))
      end

  end
end
