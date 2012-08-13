desc "Getting the users tweets every night"
task :get_tweets => :environment do
    puts "Getting users tweets"
    TwitterClient.get_users_tweets
    puts "done."
end