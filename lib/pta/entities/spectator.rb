require 'lotus/entity'
require 'digest/md5'

class Spectator
  include Lotus::Entity
  attributes :article_id, :reader_user_id, :created_at, :md5 # :id is implicit
  attr_reader :md5

  def reader=(user)
    self.reader_user_id = user.id
    make_md5
  end

  def reader
    @user ||= UserRepository.find(reader_user_id)
  end

  def article=(article)
    self.article_id = article.id
    make_md5
  end

  def article
    @article ||= ArticleRepository.find(article_id)
  end

  private

  def make_md5
    self.created_at = Time.now

    key = "#{self.article_id}:#{self.reader_user_id}"
    self.md5 = Digest::MD5.new.update(key).to_s
  end
end
