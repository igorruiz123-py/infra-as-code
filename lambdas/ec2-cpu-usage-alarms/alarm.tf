resource "aws_cloudwatch_metric_alarm" "cpu_usage_metric" {
  alarm_name        = "EC2 CPU Usage Alarm"
  alarm_description = "Alarm for EC2 instances operating with CPU utilization above 50% for 1 minute"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods  = 1
  datapoints_to_alarm = 1

  threshold = 50

  treat_missing_data = "notBreaching"

  alarm_actions = [aws_sns_topic.ec2_cpu_usage_topic.arn]

  ok_actions = [aws_sns_topic.ec2_cpu_usage_topic.arn]

  metric_query {
    id = "q1"

    expression = <<-EOT
      SELECT AVG(CPUUtilization) FROM "AWS/EC2" GROUP BY tag.Name ORDER BY AVG() DESC
    EOT

    period      = 60
    label       = "EC2 CPU Utilization"
    return_data = true
  }
}