const std = @import("std");

pub fn day2() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [4]u8 = undefined;
    var score: u32 = 0;
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        if (line[0] == 'e') break;
        score += switch (line[0]) {
            'A' => switch (line[2]) {
                'X' => 3 + 1,
                'Y' => 6 + 2,
                'Z' => 0 + 3,
                else => 0,
            },
            'B' => switch (line[2]) {
                'X' => 0 + 1,
                'Y' => 3 + 2,
                'Z' => 6 + 3,
                else => 0,
            },
            'C' => switch (line[2]) {
                'X' => 6 + 1,
                'Y' => 0 + 2,
                'Z' => 3 + 3,
                else => 0,
            },
            else => 0,
        };
    }
    try stdout.print("{}\n", .{score});
}
