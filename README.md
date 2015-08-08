# Meshblu Splunk Forwarder
> Forward your [Meshblu](https://github.com/octoblu/meshblu) messages and events to Splunk.

## Oh, cool! But, why?
Meshblu devices contain lots of valuable data. Often times, you may want to analyze your data to discover interesting, meaningful patterns to better inform how you can react, plan, or predict. Meshblu Splunk Forwarder is a logger that enables you to forward your data to your [Splunk](https://splunk.com) instance.

## Install
1. First, create a [splunk config file](http://dev.splunk.com/view/javascript-sdk/SP-CAAAEFM).

2. Now, we'll need to pull down [Meshblu](https://github.com/octoblu/meshblu):
  - `mkdir meshblu && cd $_`
  - `npm install meshblu`

3. Also, let's pull down the Meshblu Splunk Forwarder:
  - `mkdir && cd $_`
  - `npm install meshblu-splunk-forwarder`

4. In order to more easily create a Meshblu device -- which is just a JSON object -- we'll use [Meshblu Util](https://github.com/octoblu/meshblu-util):
  - `npm install -g meshblu-util`

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
This device is strictly a forwarder; it listens for messages from other devices to be logged/sent/forwarded to Splunk. So let's create another device, which this new forwarder can use.

- `mkdir device-a && cd $_`

Again, in order to create and register a device, we'll use Meshblu Util.

`meshblu-util register -o -s localhost:3000`

Your new device may look something like this:

``` javascript
{
  "uuid": "GENERATED-UUID",
  "token": "GENERATED-TOKEN",
  "server": "localhost",
  "port": "3000",
  "type": "device:test"
}
```

Also in the sample device directory, let's create a `message.json` file -- a pretend message that our sample device happened to create and we intend to pass to the forwarder:

``` javascript
{
  "devices": ["*"],
  "payload": {
    "temp": 88
  }
}
```


## Usage
Now that we've installed packages and set-up devices, let's use 'em.

Open up a terminal, navigate to your meshblu directory to run meshblu with the following command:

`FORWARD_EVENT_DEVICES={ENTER-SPLUNK-FORWARDER-UUID} nodemon server.js --http`


Now that meshblu is running, open up a new terminal tab or window, navigate to your sample device's directory and run this command:
- `meshblu-util-message -f message.json`

Using Meshblu Util, Meshblu will broadcast your `message.json`. The forwarder will listen for that message and push it to your splunk instance.
