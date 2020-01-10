load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")

def _cc_proto_blacklist_test_impl(ctx):
    """Verifies that there are no C++ compile actions for Well-Known-Protos.

    Args:
      ctx: The rule context.

    Returns: A (not further specified) sequence of providers.
    """

    env = unittest.begin(ctx)

    asserts.equals(env, 0, len(ctx.files.deps))

    return unittest.end(env)

cc_proto_blacklist_test = unittest.make(
    impl = _cc_proto_blacklist_test_impl,
    attrs = {
        "deps": attr.label_list(
            mandatory = True,
            providers = [CcInfo],
        ),
    },
)
