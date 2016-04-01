# Computer Security: Collision Resistance Testing

The two Perl scripts are used to look for strong and weak collisions of CRC32 hashes.

CRCStrong takes two random strings, calculates their CRC32 hashes, and uses a hash table to find a strong collision. (When two random inputs create the same output hash) The elapsed time is displayed.

CRCWeak takes a preset CRC32 hash of an MD5 of a student number and uses brute force to find a weak collision. (When an input creates the same output hash as another preset input). The student number hardcoded in took around 5 hours to find a weak collision.
