require 'date'

class Item
  attr_writer :genre, :author, :source, :labels

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archive = archived
  end

  def move_to_archive
    @archive = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date < Date.today.prev_year(10)
  end
end
