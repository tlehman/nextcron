class CronJob
  # raw entry is something like '*/2 * 3 * 1-2,4-5'
  def initialize(raw_entry)
    @raw_entry = raw_entry
  end

  def parse
    @raw_entry.split(/\s+/).split(',')
  end

  def next_time
  end
end

module CronEntryPattern
  class << self
    def num
      /\d+/
    end

    def star
      /\*/
    end

    def star_over_num
      /#{star}\/#{num}/
    end

    def num_dash_num
      /#{num}-#{num}/
    end
  end
end

