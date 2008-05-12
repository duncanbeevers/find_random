class ActiveRecord::Base
  def self.find_first_random
    find(:first, :offset => rand(count))
  end

  def self.find_random how_many
    find(find_random_ids)
  end

  def find_random_ids how_many
    ids = []
    all_ids = find(:all, :select => 'id').map do |e| e.id end
    how_many.times do
      ids << all_ids.delete_at(rand(all_ids.size))
    end
    ids
  end
end
