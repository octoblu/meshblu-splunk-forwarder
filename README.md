# Meshblu Splunk Forwarder
> Forward your [Meshblu](https://github.com/octoblu/meshblu) messages and events to Splunk.

## Oh, cool! But, why?
Meshblu devices contain lots valuable data. Often times, you may want to analyze your data to discover interesting, meaningful patterns to better inform how you can react, plan, or predict. Meshblu Splunk Forwarder, therefore, enables you to forward all of your data to your [Splunk](https://splunk.com) instance.

## Install
Let's pull down the Meshblu Splunk forwarder:

- `npm install meshblu-splunk-forwarder`

In order to more easily create a Meshblu device (which is just a JSON object), we can use [Meshblu Util](https://github.com/octoblu/meshblu-util):

- `npm install -g meshblu-util`

## Setup
- Create the actual device (meshblu-util)
- Create a message(.json) to forward

## Usage
- `meshblu-util-message -f message.json`

Here's a message we want to forward to 
``` javascript
{
  "devices": ["30cf02bb-cbd0-473c-aeff-da5e658e7461"],
  "payload": {
    "foo": "bar"
  }
}
```

## Logging all events (global)
