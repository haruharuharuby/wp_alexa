#
# ---How to use
#
# digest.check_digest(service_id, media.media_key, digest)

import hashlib

def check_digest(args, media_key, digest):
    try:
        key = str(media_key) + ":"
        for i in args:
            key = key + i + ":"

        if digest == hashlib.sha256(key).hexdigest():
        else:
            raise Exception("無効なダイジェストです")
    except Exception as e:
        logger.error("digest error:" + e)
        raise e
