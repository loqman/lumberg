module Lumberg
  module Whm
    class Mail < Base
      # Public: Retrieves email delivery records.
      # options - Hash options  for API call params (default: {}):
      # :nosize               - Whether to return successful delivery attempts.
      #                         true — Return successful delivery attempts.
      #                         false — Do not return successful delivery attempts.
      # :defer                - Whether to return delivery deferral events.
      #                         true — Return delivery deferral events.
      #                         false — Do not return delivery deferral events.
      # :failure              - Whether to return delivery failure events.
      #                         true — Return delivery failure events.
      #                         false — Do not return delivery failure events.
      # :inprogress           - Whether to return delivery attempts in progress.
      #                         true — Return delivery attempts in progress.
      #                         false — Do not return delivery attempts in progress.
      # :deliverytype         - The type of delivery records to retrieve.
      #                         all — Retrieve all delivery records.
      #                         remote — Retrieve remote delivery records.
      #                         local — Retrieve local delivery records.
      # :max_results_by_type  - The number of results to return for each type.
      def emailtrack_search(options = {})
        server.perform_request('emailtrack_search', options.merge(:"api.version" => 1))
      end

      # Public: Retrieves email tracking statistics.
      # options - Hash options  for API call params (default: {}):
      # :records              - The email address to query.
      # :starttime            - The start time of the search window.
      #                         A valid date in UNIX time format.
      # :endtime              - The end time of the search window.
      #                         A valid date in UNIX time format.
      # :deliverytype         - The type of delivery to query.
      #                         remote, remote-or-faildefer, local
      # :nosuccess            - Whether to hide the SUCCESSCOUNT parameter.
      # :nosize               - Whether to hide the TOTALSIZE parameter.
      def emailtrack_stats(options = {})
        server.perform_request('emailtrack_stats', options.merge(:"api.version" => 1))
      end

      # Public: Retrieves email tracking statistics for each user.
      # options - Hash options  for API call params (default: {}):
      # :records              - The email address to query.
      # :starttime            - The start time of the search window.
      #                         A valid date in UNIX time format.
      # :endtime              - The end time of the search window.
      #                         A valid date in UNIX time format.
      # :deliverytype         - The type of delivery to query.
      #                         remote, remote-or-faildefer, local
      def emailtrack_user_stats(options = {})
        server.perform_request('emailtrack_user_stats', options.merge(:"api.version" => 1))
      end

      # Public: Retrieves the contents of the server's mail queue.
      # This function does not accept parameters.
      def fetch_mail_queue(options = {})
        server.perform_request('fetch_mail_queue', options.merge(:"api.version" => 1))
      end

      # Public: Lists a cPanel account’s email accounts.
      # options - Hash options  for API call params (default: {}):
      # :user                 - The cPanel account user for which to list all owned email accounts.
      def list_pops_for(options = {})
        server.perform_request('list_pops_for', options.merge(:"api.version" => 1))
      end

      # Public: Configures your Apache SpamAssassin™ options.
      # options - Hash options  for API call params (default: {}):
      # :allowedips           - IP addresses that are authorized to access the spamd daemon.
      #                         A comma-separated list of valid IP addresses
      # :maxconnperchild      - The maximum number of connections that spamd allows per child process.
      #                         A positive integer.
      # :maxchildren          - The maximum number of children per spamd process.
      #                         A positive integer.
      # :pidfile              - The process ID file.
      #                         An absolute path and filename.
      # :timeouttcp           - The maximum amount of time that spamd waits before
      #                         it abandons a TCP connection.
      # :timeoutchild         - The maximum amount of time that a child process
      #                         waits before it abandons a TCP connection.
      def save_spamd_config(options = {})
        server.perform_request('save_spamd_config', options.merge(:"api.version" => 1))
      end

    end
  end
end
