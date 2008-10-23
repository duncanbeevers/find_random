class ActiveRecord::Base
  def self.find_one_random
    find(:first, :offset => rand(count))
  end

  def self.find_random how_many
    find(find_random_ids(how_many))
  end

  def self.find_random_ids how_many
    all_ids = respond_to?(:find_ids) ?
      find_ids :
      find(:all, :select => 'id').map { |e| e.id }
    
    ids = []
    how_many.times do
      ids << all_ids.delete_at(rand(all_ids.size))
    end
    
    ids
  end
end
