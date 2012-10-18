[![Build Status](https://travis-ci.org/senseobservationsystems/omniauth-sense.png)](https://travis-ci.org/senseobservationsystems/omniauth-sense)

OmniAuth is a ruby gems for doing authentication. They support multiple service to authenticate.
This is OmniAuth extension for authentication to CommonSense using OAuth protocol. 
more information about OmniAuth is in [OmniAuth Documentation](https://github.com/intridea/omniauth/wiki)

## Usage
First register your application to CommonSense by visiting [OAuth registration page](http://api.sense-os.nl/oauth/register_app)
You will obtain application KEY and Application Secret

The information that is required for the application

**Application type** : browser

**Callback URL**
You have to setup the callback URL as the folowing
http://[yourdomain.com]/auth/sense/callback

If you are only testing, then the domain should not be necessary acessible by public.
as long as that domain mapped to ip address of the application that running this library.
You can add maping the domain main on /etc/hosts to test it temporarily

```ruby
use OmniAuth::Builder do
 provider :sense, ENV['APPLICATION_KEY'], ENV['APPLICATION_SECRET']
end
```

## Testing sample
```bash
$ bundle # this will install dependency
$ bundle exec ruby sample/sense_oauth.rb
```

it will start a sinatra app running on localhost port 4567

## License

Copyright (c) 2012 Sense Observation Systems B.V.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
