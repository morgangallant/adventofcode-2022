const std = @import("std");

pub fn day2() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    const part2 = true;

    var buf: [4]u8 = undefined;
    var score: u32 = 0;
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        if (line[0] == 'e') break;
        if (part2) {
            line[2] = switch (line[2]) {
                'X' => switch (line[0]) {
                    'A' => 'Z',
                    'B' => 'X',
                    'C' => 'Y',
                    else => unreachable,
                },
                'Y' => switch (line[0]) {
                    'A' => 'X',
                    'B' => 'Y',
                    'C' => 'Z',
                    else => unreachable,
                },
                'Z' => switch (line[0]) {
                    'A' => 'Y',
                    'B' => 'Z',
                    'C' => 'X',
                    else => unreachable,
                },
                else => unreachable,
            };
        }
        score += switch (line[0]) {
            'A' => switch (line[2]) {
                'X' => 3 + 1,
                'Y' => 6 + 2,
                'Z' => 0 + 3,
                else => unreachable,
            },
            'B' => switch (line[2]) {
                'X' => 0 + 1,
                'Y' => 3 + 2,
                'Z' => 6 + 3,
                else => unreachable,
            },
            'C' => switch (line[2]) {
                'X' => 6 + 1,
                'Y' => 0 + 2,
                'Z' => 3 + 3,
                else => unreachable,
            },
            else => unreachable,
        };
    }
    try stdout.print("{}\n", .{score});
}
