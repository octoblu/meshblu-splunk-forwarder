# Meshblu Splunk Forwarder
> Forward your [Meshblu](https://github.com/octoblu/meshblu) messages and events to Splunk.

## Oh, cool! But, why?
Meshblu devices contain lots of valuable data. Often times, you may want to analyze your data to discover interesting, meaningful patterns to better inform how you can react, plan, or predict. Meshblu Splunk Forwarder is a logger that enables you to forward your data to your [Splunk](https://splunk.com) instance.

## Install
First, we'll need to pull down [Meshblu](https://github.com/octoblu/meshblu).

- `mkdir meshblu && cd $_`
- `npm install meshblu`

Now, let's pull down the Meshblu Splunk forwarder.

- `mkdir && cd $_`
- `npm install meshblu-splunk-forwarder`

In order to more easily create a Meshblu device -- which is just a JSON object -- we can use [Meshblu Util](https://github.com/octoblu/meshblu-util):

`npm install -g meshblu-util`

## Setup
Since Meshblu Splunk Forwarder is a part of Meshblu, we consider it a device and must be registered to Meshblu. Here's how to register your device:

`meshblu-util register -s {YOUR-DOMAIN} > meshblu.json`

Meshblu Util uses Meshblu to generate an UUID and token for your forwarder, registers it, and saves its configuration to `meshblu.json`.

Now, within your `meshblu.json`, we'll need to update the "server" property name to "hostname" (keep the value the same). Also, we need to add a "protocol" property with the value of "ws".

Here is how your `meshblu.json` (device configuration) should look:

``` javascript
{
  "uuid": "YOUR-UUID",
  "token": "YOUR-TOKEN",
  "hostname": "localhost",
  "port": "3000",
  "protocol": "ws",
  "type": "device:splunk"
}
```

You created your device. Awesome.
This device is strictly a forwarder; it listens for messages from other devices to be logged/sent/forwarded to Splunk. So let's create another device which this new forwarder can use.

- `mkdir device-a && cd $_`

Again, in order to create and register a device, we'll use Meshblu Util.

`meshblu`

- Create a message(.json) to forward
chelle

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
