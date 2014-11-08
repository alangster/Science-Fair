class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :text, presence: true

  def get_all_subcomments
    return recursive_comments(self)
  end

  def in_reply_to
    return commentable_type == "Comment" ? user_responded_to : ""
  end

  def user_responded_to
    return self.commentable.user.name
  end

  def reply_tree
    self.comments.map(&:comment_tree)
  end

  def comment_tree
    [self] + self.comments.map(&:comment_tree)
  end

  def as_json
    {
      text: text,
      user_id: user.id,
      name: user.name,
      points: points,
      in_reply_to: in_reply_to
    }
  end

  private
  def recursive_comments(comment, all_comments=[])
    if comment.comments != nil
      comment.comments.each do |children|
        all_comments << children
        recursive_comments(children, all_comments)
      end
    else
      all_comments << comment
    end
    return all_comments
  end

end
