# STrelok

Application for STIX v2.0 objects management and analysis

## Requirements

* docker-compose (tested with version 1.14.0)

## Quick Start

1. Clone the repository and enter the directory.
2. Run docker-compose.
```
$ docker-compose up
```
3. Connect to the server's port 8000 from web browser.

If you don't like to start server on 0.0.0.0, please add static IP address to "ports" in docker-compose.yml as follows:

```
      - "8000:8000" -> "127.0.0.1:8000:8000"
```

## Notes

- Please use it at your own risk.
- This app needs to use Highsoft's JavaScript charting library Highcharts. It is allowed to distribute with non-commercial packages but not free for commercial and Governmental use. 
  - Highcharts: http://shop.highsoft.com/highcharts.html

## Screenshots and Usage

### Top page

![top](https://github.com/JPCERTCC/STrelok/raw/images/top.PNG)

### Timeline

![timeline](https://github.com/JPCERTCC/STrelok/raw/images/timeline.PNG)		

For timeline, you need to create STIX objects: threat-actor, campaign, identity, sighting

1. Create threat-actor. You need login to create STIX objects. 
2. Create campaign and add relation "campaign attributed-to threat actor". You need to set the period of the campaign.
3. Create identity and add sighting of campaign. You need to set the period of the sighting.

STIX objects "report" also appears on the timeline. Create report and add object_refs of threat-actor. 

### TTP Matrix

![matix](https://github.com/JPCERTCC/STrelok/raw/images/matrix.PNG)

For TTP Matrix, you need to create STIX objects: threat-actor, campaign, malware or tool or attack-pattern

1. Create threat-actor, campaign and their relation as above Timeline
2. Create malware or attack-pattern or tool and add relation "campaign uses malware/attack-pattern/tool". You need to set a kill chain phase of the objects.
