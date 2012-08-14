<<<<<<< HEAD
= paginate @articles
.showpage_container
  .tag_container
    = image_tag @user.image_url
    - user_tweets = []
    - @tweets.each do |tweet|
      - tweet.hashtags.each do |hashtag|
        - unless user_tweets.include?(hashtag.text)
          - user_tweets << hashtag.text
          %br
          .tags_left
            = hashtag.text.upcase
=======