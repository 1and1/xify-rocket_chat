require 'json'
require 'net/https'
require 'time'

require 'xify/base/rocket_chat'

module Xify
  module Output
    class RocketChat < Base::RocketChat
      def process(event)
        request :post, '/api/v1/chat.postMessage' do |req|
          filtered_message = filter_tags(event.message.chomp)
          req['Content-Type'] = 'application/json'
          req.body = {
            channel: @config['channel'],
            alias: event.author,
            attachments: [
              {
                title: event.args[:parent],
                title_link: event.args[:parent_link],
                text: event.args[:link] ? "#{filtered_message}\n\n([link to source](#{event.args[:link]}))" : filtered_message
              }
            ]
          }.to_json
        end
      end

      private
      def filter_tags(string)
        string.gsub(/\<\/code\>/, '```').gsub(/```(.*)```/, '`$1`').gsub(/\<\/?[^>]\>/, '')
      end
    end
  end
end
