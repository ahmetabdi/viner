## Information
![vine_logo](https://pbs.twimg.com/profile_images/3578238864/50d7e05aa6fe5d477e48a63047e38ce7.png)
### viner

Wrapper to access the unofficial Vine API.

Vine is currently available for iOS and Android devices. You can download Vine for iOS in the [Apple App Store](https://itunes.apple.com/us/app/vine/id592447445?mt=8), and Vine for Android in the [Google Play Store](https://play.google.com/store/apps/details?id=co.vine.android). After installing Vine on your device, you can sign up using an email address or sign in with your Twitter account.

An account is needed for all calls to the API.

[https://viner.herokuapp.com/](https://viner.herokuapp.com/)

## Requirements

Ruby >= 2.0

## Getting started

```ruby
gem install viner
```

### Start new client
```ruby
@client = Viner::Client.new
```
### Login
```ruby
@client.login("username", "password")
```
### Logout
```ruby
@client.logout
```
### Popular Vines
```ruby
@client.popular
```
### Vines by any tag
```ruby
@client.tag("cats")
```
### Profiles

Your profile
```ruby
@client.profile
```

Find profile
```ruby
@client.profile(user_id)
```
### Posts
```ruby
@client.profile(post_id)
```

### Notifications
```ruby
@client.profile(user_id)
```

## Running tests

To run all the tests you need to enter a valid user account username and password in [spec_helper.rb](https://github.com/ahmetabdi/viner/blob/master/spec/spec_helper.rb#L3)
