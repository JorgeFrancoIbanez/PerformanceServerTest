# Demo
1. Create from the snapshot
2. On uat_service001 watch the measures aggregation
    watch -n 5  "gnocchi measures aggregation --refresh --resource-type instance --query 'server_group=\"e8e0ea6a-586d-4b5c-8d42-5074eb264929\" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util"
3. On uat_service001 watch the alarms
    watch -n 5  aodh alarm list -t gnocchi_aggregation_by_resources_threshold
4. Stress one of the servers to 60% , the average load should increase to 60% and once the second server comes in the average load shoudl reduce to 30%
    curl -X POST "http://192.168.211.132/stress?load=60&timeout=100000"
5. Monitor the server load using
    watch -n 1 'curl -s -X GET "http://192.168.211.132/load"  | jq .'


# Check if the server is ready
watch -n 5 "curl -s -X GET 'http://<lb-ip>/load' "

# Monitor which servers are responding
watch -n 5 "curl -s -X GET 'http://192.168.211.135/' | jq .network.eth0[0].address "
watch -n 5 "curl -s -X GET 'http://192.168.211.135/load' | jq .ip "

# Calculate pi and et the average load
watch -n 5 "curl -s -X GET 'http://192.168.211.135/load'

# Create load on a server
curl -X POST "http://192.168.211.135/stress?load=60&timeout=6000"

# List Gnocchi Alarms
aodh alarm list --type gnocchi_aggregation_by_resources_threshold

openstack stack list

openstack stack show <the-stack-id>

# Shows the size of the Autoscaling Group
openstack stack show <the-stack-id> -f json | jq .outputs[2]
openstack stack show <the-stack-id> -f json | jq .outputs[2].output_value


#Get gnocchi measures aggregation
gnocchi measures aggregation --refresh --resource-type instance --query 'server_group="<the-stack-id>" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util
gnocchi measures aggregation --refresh --resource-type instance --query 'server_group="<the-stack-id>" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util


# Extract mean stack reading
gnocchi measures aggregation --refresh --resource-type instance --query 'server_group="25b526ba-b34d-4496-a8d8-41c52e601d05" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util | tail -2 | head -1 | awk -F '|' '{print $2 " " $4}'

watch -n 5  "gnocchi measures aggregation --refresh --resource-type instance --query 'server_group=\"<the-stack-id>\" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util"

#### WIP
## Add the number of stacks to a file
echo -n `date ` >> francisco_test
openstack stack show <the-stack-id> -f json | jq .outputs[2].output_value  >> file_num_stacks


gnocchi measures aggregation --refresh --resource-type instance --query 'server_group="<the-stack-id>" and ended_at=None' --granularity 60 --aggregation mean -m cpu_util | tail -2 | head -1 | awk -F '|' '{print $2 " " $4}' >> file_measures
