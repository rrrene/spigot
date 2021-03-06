module Spigot
  module Mapping
    class User
      def self.basic
        template do
          full_name :name
          login     :username
        end
      end

      def self.abridged
        Spigot.resource :user do
          full_name :name
          login     :username
        end
      end

      def self.interpolated
        template do
          full_name :name
          login :username do |value|
            "@#{value}"
          end
        end
      end

      def self.nested_interpolation
        template do
          full_name :name
          login do
            email      :contact
            user_name  :username do |value|
              "@#{value}"
            end
          end
        end
      end

      def self.nested
        template do
          full_name :name
          login do
            email     :contact
            user_name :username
          end
        end
      end

      def self.serviceless
        Spigot.define do
          resource :user do
            full_name :name
            login     :username
          end
        end
      end

      def self.multiple_serviceless
        Spigot.define do
          resource :user do
            full_name :name
            login     :username
          end

          resource :post do
            title :headline
            body  :body
          end
        end
      end

      def self.service_and_serviceless
        Spigot.define do
          resource :user do
            full_name :name
            login     :username
          end

          service :github do
            resource :user do
              login :name
              full_name :username
            end
          end
        end
      end

      def self.nested_twice
        template do
          full_name :name
          login do
            last_seen_ip :ip
            contact do
              email     :contact
              user_name :username
            end
          end
        end
      end

      def self.nested_array
        template do
          account :name
          count   :user_count
          users do
            full_name :name
            login :username
          end
        end
      end

      def self.with_options
        template do
          full_name :name
          login     :username
          options do
            primary_key :username
          end
        end
      end

      def self.with_conditions
        template do
          full_name :name
          login     :username
          options do
            primary_key :username
          end
        end
      end

      private

      def self.template(&block)
        Spigot.define do
          service :github do
            resource :user do
              instance_eval(&block)
            end
          end
        end
      end
    end
  end
end
