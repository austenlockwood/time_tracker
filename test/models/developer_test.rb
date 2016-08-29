require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  def austen
    @austen ||= Developer.create!(
      name: 'Austen',
      email: 'austen@austen.austen',
      password: 'austen'
    )
  end


  test "can have weekly total" do
    assert_equal [], austen.time_logs
    #
    # first_entry = TimeLog.create!(project_id: 1, developer_id: austen.id, date: Date.today, minutes: 30)
    first_entry = austen.time_logs.create(
      project_id: 1,
      date: Date.today,
      minutes: 100
    )

    # austen.time_logs.reload

    assert_equal [ first_entry ], austen.time_logs

    second_entry = austen.time_logs.create(
      project_id: 1,
      date: 100.days.ago,
      minutes: 100
    )

    assert_equal 100, austen.time_entered_in_current_week
  end
end
