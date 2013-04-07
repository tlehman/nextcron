require 'test/unit'
require './cron_job'

class CronJobTest < Test::Unit::TestCase
  def test_parse()
    cron_job = CronJob.new('*/1  * * * 1-3,5-13')
    assert_equal 5, cron_job.parse.length
  end

  def test_num()
  end

  def test_star()
  end

  def test_star_over_num()
  end

  def test_num_dash_num()
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

