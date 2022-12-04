const std = @import("std");

pub fn day1() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [1024]u8 = undefined;
    var current_sum: i32 = 0;
    var max_sum: i32 = 0;
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        // if line is empty, compare current_sum to max_sum and reset current_sum
        if (line.len == 0) {
            if (current_sum > max_sum) {
                max_sum = current_sum;
            }
            current_sum = 0;
            continue;
        } else if (std.mem.eql(u8, line, "exit")) {
            break;
        }
        const num = try std.fmt.parseInt(i32, line, 10);
        current_sum += num;
    }

    try stdout.print("{}\n", .{max_sum});
}
