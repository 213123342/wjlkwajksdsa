local http_request = http_request;
if syn then
    http_request = syn.request
elseif SENTINEL_V2 then
    function http_request(tb)
        return {
            StatusCode = 200;
            Body = request(tb.Url, tb.Method, (tb.Body or ''))
        }
    end
end
 
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Krnl-Hwid","Fingerprint", "Proto-User-Identifier", "Sentinel-Fingerprint"};
local hwid = "";
 
for i, v in next, hwid_list do
    if decoded.headers[v] then
        hwid = decoded.headers[v];
        break
    end
end
 
if hwid then
    setclipboard(hwid)
    game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "copied hwid to clipboard";
		Text = "send to keo";
	})
else
    game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "unable to get hwid";
		Text = "rejoin and try again";
	})
end
