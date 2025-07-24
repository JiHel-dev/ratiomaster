import bencodepy

torrent = "file.torrent"
data = open(torrent, "rb").read()
struct = bencodepy.decode(data)

try:
	num_bytes = sum(entry[b"length"] for entry in struct[b"info"][b"files"])
except KeyError:
	num_bytes = struct[b"info"][b"length"]

print(num_bytes)
