require 'spec_helper'
require 'ostruct'

# Fix OpenStruct in Ruby 1.8
if RUBY_VERSION <= "1.9"
  class OpenStruct
    undef id
  end
end

describe OmniAuth::Strategies::Sense do
  before do
    @consumer_key = 'key'
    @consumer_secret = 'secret'
  end

  subject do
    args = [@consumer_key, @consumer_secret, @options].compact
    OmniAuth::Strategies::Sense.new(nil, *args)
  end

  describe '#consumer' do
    it 'has correct Sense site' do
      subject.consumer.options[:site].should eq('https://api.sense-os.nl')
    end

    it 'has correct request token url' do
      subject.consumer.options[:request_token_path].should eq('/oauth/request_token')
    end

    it 'has correct access token url' do
      subject.consumer.options[:access_token_path].should eq('/oauth/access_token')
    end

    it 'has correct authorize url' do
      subject.consumer.options[:authorize_path].should eq('/oauth/authorize')
    end
  end

  describe "#uid" do
    before do
      subject.stub(:raw_info) do
        {'user' => {'id' => '123'}}
      end
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end

  describe "#info" do
    before :each do
      subject.stub(:raw_info) do
        { "user" => 
          {
            "id" => "1",
            "email" => "jan@test.nl",
            "username" => "janjager",
            "name" => "Jan",
            "surname" => "Jager",
            "mobile" => "0031612345678",
            "UUID" => "377bc208-5333-102e-aa53-005056bc6a30"
          }
        }
      end
    end

    it 'returns the name from raw_info' do
      subject.info['name'].should eq('Jan')
    end

    it 'returns the email from raw_info' do
      subject.info['email'].should eq('jan@test.nl')
    end

    it 'returns the username from raw_info' do
      subject.info['username'].should eq('janjager')
    end

    it 'returns the surname from raw_info' do
      subject.info['surname'].should eq('Jager')
    end

    it 'returns the mobile from raw_info' do
      subject.info['mobile'].should eq('0031612345678')
    end

    it 'returns the UUID from raw_info' do
      subject.info['UUID'].should eq('377bc208-5333-102e-aa53-005056bc6a30')
    end
  end

  describe "#extra" do
  end

  describe "#raw_info" do
  end
end
