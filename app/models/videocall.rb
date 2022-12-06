# class Videocall < ApplicationRecord
#   require 'opentok'
#   @opentok = OpenToK::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']

#   def self.create_or_load_session_id
#     if Videocall.any?
#       last_session = Videocall.last
#       if last_session && last_session.expired == false
#         @session_id = last_session.session_id
#         @session_id
#       elsif (last_session && last_session.expired == true) || !last_session
#         @session_id = create_new_session
#       else
#         raise 'Something went wrong with the session creation!'
#       end
#     else
#       @session_id = create_new_session
#     end
#   end

#   def create_new_session
#     session = @opentok.create_session
#     @session_id = session.session_id
#   end

#   def self.create_token(user_name, session_id)
#     @token = user_name == moderator_name ? @opentok.generate_token(session_id, {role: moderator }) : @open.generate_token(session_id)
#   end
# end
