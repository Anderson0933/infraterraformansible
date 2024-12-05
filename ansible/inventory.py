#!/usr/bin/env python
import json
import boto3

region = 'us-east-1'
ec2 = boto3.client('ec2', region_name=region)

def get_instances():
    instances = ec2.describe_instances()
    hosts = []
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            hosts.append(instance['PublicIpAddress'])
    return hosts

def main():
    instances = get_instances()
    inventory = {
        "all": {
            "hosts": instances
        }
    }
    print(json.dumps(inventory, indent=4))

if __name__ == "__main__":
    main()
