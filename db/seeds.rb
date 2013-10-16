Post.create(title: "Square Cash", link: "https://square.com/cash", user_id: 2, vote: 0)
Post.create(title: "Ioke programming language", link: "https://ioke.org/", user_id: 1, vote: 0)
User.create(name: "Emily", password: "awesome", about: "i am pretty special")
User.create(name: "Steve", password: "coolman", about: "ball so hard")
Comment.create(user_id: 1, post_id: 1, comment_id: nil, paragraph: "this post is really great") 
Comment.create(user_id: 2, post_id: 1, comment_id: 1, paragraph: "I agree w Emily's post comment")




