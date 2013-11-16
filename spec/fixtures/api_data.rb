module Spigot
  class ApiData

    def self.basic_user
      {'full_name' => 'Dean Martin', 'login' => 'classyasfuck'}
    end

    def self.user
      {'full_name' => 'Dean Martin', 'login' => 'classyasfuck', 'auth_token' => '123abc'}
    end

    def self.updated_user
      {'full_name' => 'Frank Sinatra', 'login' => 'livetilidie', 'auth_token' => '456bcd'}
    end

    def self.nested_user
      {'full_name' => 'Dean Martin', 'login' => {
        'email' => 'dino@amore.io',
        'user_name' => 'classyasfuck'
      }, 'auth_token' => '123abc'}
    end

    def self.double_nested_user
      {'full_name' => 'Dean Martin', 'login' => {
        'contact' => {'work_email' => 'dino@amore.io', 'user_name' => 'classyasfuck' }
      }, 'auth_token' => '123abc'}
    end

    def self.user_array
      [{'full_name' => 'Dean Martin', 'login' => 'classyasfuck'}, {'full_name' => 'Frank Sinatra', 'login' => 'livetilidie'}]
    end

    def self.nested_user_array
      {'account' => 'Rockafella', 'users' => user_array, 'count' => 2}
    end

    def self.basic_post
      {'title' => 'Brief Article', 'body' => 'lorem ipsum'}
    end

    def self.post
      {'title' => 'Regular Article', 'body' => 'dolor sit amet', 'author' => 'Dean Martin'}
    end

  end
end
