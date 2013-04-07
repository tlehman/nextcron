class CronJob
  attr_reader :minutes, :hours, :day_of_month, 
              :month, :day_of_week

  # raw entry is something like '*/2 * 3 * 1-2,4-5'
  def initialize(raw_entry)
    @raw_entry = raw_entry
  end

  def parse
    @minutes,
    @hours,
    @day_of_month,
    @month,
    @day_of_week = @raw_entry.split(/\s+/).
                              map { |e| e.split(',') }
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

