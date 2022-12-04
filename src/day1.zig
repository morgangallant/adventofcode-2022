const std = @import("std");

pub fn day1() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [1024]u8 = undefined;
    var current_sum: i32 = 0;
    var sums = std.ArrayList(i32).init(std.heap.page_allocator);
    while (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        // if line is empty, compare current_sum to max_sum and reset current_sum
        if (line.len == 0) {
            try sums.append(current_sum);
            current_sum = 0;
            continue;
        } else if (std.mem.eql(u8, line, "exit")) {
            if (current_sum > 0) {
                try sums.append(current_sum);
            }
            break;
        }
        const num = try std.fmt.parseInt(i32, line, 10);
        current_sum += num;
    }
    var x = sums.toOwnedSlice();
    std.sort.sort(i32, x, {}, cmpByValue);

    var i: usize = 0;
    for (x) |val| {
        if (i >= 3) {
            break;
        }
        try stdout.print("{d}\n", .{val});
        i += 1;
    }
}

fn cmpByValue(context: void, a: i32, b: i32) bool {
    return std.sort.desc(i32)(context, a, b);
}
