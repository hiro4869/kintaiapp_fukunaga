i = 1

while i < 100 do
  Attendance.seed do |s|
    s.id = i
    s.user_id = rand(1..10)
    s.start = Time.now
    s.end = Time.now
    s.approval = false
  end
  i += 1
end