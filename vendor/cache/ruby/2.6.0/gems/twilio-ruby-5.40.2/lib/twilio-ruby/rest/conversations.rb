##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      ##
      # Initialize the Conversations Domain
      def initialize(twilio)
        super

        @base_url = 'https://conversations.twilio.com'
        @host = 'conversations.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of conversations
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @return [Twilio::REST::Conversations::V1::ConfigurationInstance]
      def configuration
        self.v1.configuration()
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Conversations::V1::ConversationInstance] if sid was passed.
      # @return [Twilio::REST::Conversations::V1::ConversationList]
      def conversations(sid=:unset)
        self.v1.conversations(sid)
      end

      ##
      # @return [Twilio::REST::Conversations::V1::WebhookInstance]
      def webhooks
        self.v1.webhooks()
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Conversations::V1::CredentialInstance] if sid was passed.
      # @return [Twilio::REST::Conversations::V1::CredentialList]
      def credentials(sid=:unset)
        self.v1.credentials(sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the Role
      #   resource.
      # @return [Twilio::REST::Conversations::V1::RoleInstance] if sid was passed.
      # @return [Twilio::REST::Conversations::V1::RoleList]
      def roles(sid=:unset)
        self.v1.roles(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Conversations::V1::ServiceInstance] if sid was passed.
      # @return [Twilio::REST::Conversations::V1::ServiceList]
      def services(sid=:unset)
        self.v1.services(sid)
      end

      ##
      # @param [String] chat_service_sid The SID of the [Chat
      #   Service](https://www.twilio.com/docs/chat/rest/service-resource) the
      #   Configuration applies to.
      # @return [Twilio::REST::Conversations::V1::NotificationInstance] if chat_service_sid was passed.
      # @return [Twilio::REST::Conversations::V1::NotificationList]
      def notifications(chat_service_sid=:unset)
        self.v1.notifications(chat_service_sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the User
      #   resource.
      # @return [Twilio::REST::Conversations::V1::UserInstance] if sid was passed.
      # @return [Twilio::REST::Conversations::V1::UserList]
      def users(sid=:unset)
        self.v1.users(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Conversations>'
      end
    end
  end
end