class FavoriteMailer < ActionMailer::Base
  default from: "scotthale12@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    #new headers
    headers["Message-ID"] = "<comments/#{@comment.id}@hale-bloccit>"
    headers["In-Reply-To"] = "<post/#{@post.id}@hale-bloccit>"
    headers["References"] = "<post/#{@post.id}@hale-bloccit>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
