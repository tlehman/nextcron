require 'test/unit'
require './cron_job'

class CronJobTest < Test::Unit::TestCase
  def cron_tab # every minute
    '*/1  * * * 1-3,5-13'
  end

  def test_parse
    cron_job = CronJob.new(cron_tab)
    assert_equal 5, cron_job.parse.length
    assert_equal 2, cron_job.parse.last.length
  end

  def test_next_time
    cron_job = CronJob.new(cron_tab)
    sec, min, hour, day, month, year = Time.now.to_a[(0..6)]
    one_minute_from_now = Time.new(year, month, day, 
                                   hour, min, sec)

    assert_equal one_minute_from_now, cron_job.next_time
  end
end

class CronEntryPatternTest < Test::Unit::TestCase
  def test_num
    assert_not_nil CronEntryPattern.num =~ '21'
  end

  def test_star
    assert_not_nil CronEntryPattern.star =~ '*'
  end
  
  def test_star_over_num
    assert_not_nil CronEntryPattern.star_over_num =~ '*/12'
  end

  def test_num_dash_num
    assert_not_nil CronEntryPattern.num_dash_num =~ '3-12'
  end
end

