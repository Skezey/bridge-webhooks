##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class BindingList < ListResource
            ##
            # Initialize the BindingList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/notify/api/service-resource) the resource
            #   is associated with.
            # @return [BindingList] BindingList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Bindings"
            end

            ##
            # Create the BindingInstance
            # @param [String] identity The `identity` value that uniquely identifies the new
            #   resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within
            #   the [Service](https://www.twilio.com/docs/notify/api/service-resource). Up to 20
            #   Bindings can be created for the same Identity in a given Service.
            # @param [binding.BindingType] binding_type The transport technology to use for
            #   the Binding. Can be: `apn`, `fcm`, `gcm`, `sms`, or `facebook-messenger`.
            # @param [String] address The channel-specific address. For APNS, the device
            #   token. For FCM and GCM, the registration token. For SMS, a phone number in E.164
            #   format. For Facebook Messenger, the Messenger ID of the user or a phone number
            #   in E.164 format.
            # @param [String] tag A tag that can be used to select the Bindings to notify.
            #   Repeat this parameter to specify more than one tag, up to a total of 20 tags.
            # @param [String] notification_protocol_version The protocol version to use to
            #   send the notification. This defaults to the value of
            #   `default_xxxx_notification_protocol_version` for the protocol in the
            #   [Service](https://www.twilio.com/docs/notify/api/service-resource). The current
            #   version is `"3"` for `apn`, `fcm`, and `gcm` type Bindings. The parameter is not
            #   applicable to `sms` and `facebook-messenger` type Bindings as the data format is
            #   fixed.
            # @param [String] credential_sid The SID of the
            #   [Credential](https://www.twilio.com/docs/notify/api/credential-resource)
            #   resource to be used to send notifications to this Binding. If present, this
            #   overrides the Credential specified in the Service resource. Applies to only
            #   `apn`, `fcm`, and `gcm` type Bindings.
            # @param [String] endpoint Deprecated.
            # @return [BindingInstance] Created BindingInstance
            def create(identity: nil, binding_type: nil, address: nil, tag: :unset, notification_protocol_version: :unset, credential_sid: :unset, endpoint: :unset)
              data = Twilio::Values.of({
                  'Identity' => identity,
                  'BindingType' => binding_type,
                  'Address' => address,
                  'Tag' => Twilio.serialize_list(tag) { |e| e },
                  'NotificationProtocolVersion' => notification_protocol_version,
                  'CredentialSid' => credential_sid,
                  'Endpoint' => endpoint,
              })

              payload = @version.create('POST', @uri, data: data)

              BindingInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists BindingInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Date] start_date Only include usage that has occurred on or after this
            #   date. Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [Date] end_date Only include usage that occurred on or before this date.
            #   Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [String] identity The
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value
            #   of the resources to read.
            # @param [String] tag Only list Bindings that have all of the specified Tags. The
            #   following implicit tags are available: `all`, `apn`, `fcm`, `gcm`, `sms`,
            #   `facebook-messenger`. Up to 5 tags are allowed.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(start_date: :unset, end_date: :unset, identity: :unset, tag: :unset, limit: nil, page_size: nil)
              self.stream(
                  start_date: start_date,
                  end_date: end_date,
                  identity: identity,
                  tag: tag,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams BindingInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Date] start_date Only include usage that has occurred on or after this
            #   date. Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [Date] end_date Only include usage that occurred on or before this date.
            #   Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [String] identity The
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value
            #   of the resources to read.
            # @param [String] tag Only list Bindings that have all of the specified Tags. The
            #   following implicit tags are available: `all`, `apn`, `fcm`, `gcm`, `sms`,
            #   `facebook-messenger`. Up to 5 tags are allowed.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(start_date: :unset, end_date: :unset, identity: :unset, tag: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  start_date: start_date,
                  end_date: end_date,
                  identity: identity,
                  tag: tag,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields BindingInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [Date] start_date Only include usage that has occurred on or after this
            #   date. Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [Date] end_date Only include usage that occurred on or before this date.
            #   Specify the date in GMT and format as `YYYY-MM-DD`.
            # @param [String] identity The
            #   [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value
            #   of the resources to read.
            # @param [String] tag Only list Bindings that have all of the specified Tags. The
            #   following implicit tags are available: `all`, `apn`, `fcm`, `gcm`, `sms`,
            #   `facebook-messenger`. Up to 5 tags are allowed.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of BindingInstance
            def page(start_date: :unset, end_date: :unset, identity: :unset, tag: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'StartDate' => Twilio.serialize_iso8601_date(start_date),
                  'EndDate' => Twilio.serialize_iso8601_date(end_date),
                  'Identity' => Twilio.serialize_list(identity) { |e| e },
                  'Tag' => Twilio.serialize_list(tag) { |e| e },
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              BindingPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of BindingInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              BindingPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Notify.V1.BindingList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class BindingPage < Page
            ##
            # Initialize the BindingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [BindingPage] BindingPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of BindingInstance
            # @param [Hash] payload Payload response from the API
            # @return [BindingInstance] BindingInstance
            def get_instance(payload)
              BindingInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Notify.V1.BindingPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class BindingContext < InstanceContext
            ##
            # Initialize the BindingContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/notify/api/service-resource) to fetch the
            #   resource from.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Binding resource to fetch.
            # @return [BindingContext] BindingContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Bindings/#{@solution[:sid]}"
            end

            ##
            # Fetch the BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              BindingInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the BindingInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Notify.V1.BindingContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Notify.V1.BindingContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class BindingInstance < InstanceResource
            ##
            # Initialize the BindingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the
            #   [Service](https://www.twilio.com/docs/notify/api/service-resource) the resource
            #   is associated with.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Binding resource to fetch.
            # @return [BindingInstance] BindingInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'credential_sid' => payload['credential_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'notification_protocol_version' => payload['notification_protocol_version'],
                  'endpoint' => payload['endpoint'],
                  'identity' => payload['identity'],
                  'binding_type' => payload['binding_type'],
                  'address' => payload['address'],
                  'tags' => payload['tags'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [BindingContext] BindingContext for this BindingInstance
            def context
              unless @instance_context
                @instance_context = BindingContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Service that the resource is associated with
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The SID of the Credential resource to be used to send notifications to this Binding
            def credential_sid
              @properties['credential_sid']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The protocol version to use to send the notification
            def notification_protocol_version
              @properties['notification_protocol_version']
            end

            ##
            # @return [String] Deprecated
            def endpoint
              @properties['endpoint']
            end

            ##
            # @return [String] The `identity` value that identifies the new resource's User
            def identity
              @properties['identity']
            end

            ##
            # @return [String] The type of the Binding
            def binding_type
              @properties['binding_type']
            end

            ##
            # @return [String] The channel-specific address
            def address
              @properties['address']
            end

            ##
            # @return [String] The list of tags associated with this Binding
            def tags
              @properties['tags']
            end

            ##
            # @return [String] The absolute URL of the Binding resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The URLs of related resources
            def links
              @properties['links']
            end

            ##
            # Fetch the BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the BindingInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Notify.V1.BindingInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Notify.V1.BindingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end