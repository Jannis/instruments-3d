module base()
{
	// Base board
	difference() {
		color([0, 0, 0])
			cube([1000, 400, 20]);

		// Hole for cutter head
		translate([500, 200, 0])
			cylinder(40, 25, 25, true);
	}

	// Sockets at the bottom of the board
	translate([0, 0, -400])
		color([1.0, 1.0, 1.0])
		cube([200, 50, 400]);
	translate([0, 350, -400])
		color([1.0, 1.0, 1.0])
		cube([200, 50, 400]);
	translate([50, 50, -400])
		rotate(90)
		color([1.0, 1.0, 1.0])
		cube([300, 50, 400]);

	translate([800, 0, -400])
		color([1.0, 1.0, 1.0])
		cube([200, 50, 400]);
	translate([800, 350, -400])
		color([1.0, 1.0, 1.0])
		cube([200, 50, 400]);
	translate([1000, 50, -400])
		rotate(90)
		color([1.0, 1.0, 1.0])
		cube([300, 50, 400]);

	// Runners for shell mount
	translate([10, 10, 20])
		color([1, 1, 1])
		cube([980, 25, 25]);
	translate([10, 365, 20])
		color([1, 1, 1])
		cube([980, 25, 25]);
}

module rod_mount()
{
	// Outer mounts for the threaded rod
	difference() {
		translate([10, 35, 20])
			color([0.8, 0.6, 0.5])
			cube([50, 330, 300]);

		translate([0, 200, 230])
			rotate([0, 90, 0])
			cylinder(70, 10, 10);
	}
	difference() {
		translate([940, 35, 20])
			color([0.8, 0.6, 0.5])
			cube([50, 330, 300]);

		translate([930, 200, 230])
			rotate([0, 90, 0])
			cylinder(70, 10, 10);
	}
}

module rod()
{
	translate([-100, 200, 230])
		rotate([0, 90, 0])
		color([0.5, 0.5, 0.5])
		cylinder(1200, 10, 10);
}

module shell()
{
	// Example drum shell (14"x6.5")
	d = 14 * 2.54 * 10;
	h = 6.5 * 2.54 * 10 + 10;

	translate([500, 200, 230])
	rotate([0, 90, 0])
	difference() {
		cylinder(h, d / 2, d / 2, true);
		cylinder(h + 20, d / 2 - 12, d / 2 - 12, true);
	}
}

module shell_mount()
{
	// Runners for the shell
	difference() {
		translate([367.45, 35, 20])
			color([0.8, 0.6, 0.5])
			cube([25, 330, 300]);

		translate([357.45, 200, 230])
			rotate([0, 90, 0])
			cylinder(45, 10, 10);
	}
	difference() {
		translate([607.55, 35, 20])
			color([0.8, 0.6, 0.5])
			cube([25, 330, 300]);

		translate([597.55, 200, 230])
			rotate([0, 90, 0])
			cylinder(45, 10, 10);
	}


	d = 14 * 2.54 * 10;

	// Round plates to mount the drum shell
	// Example drum shell (14"x6.5")
	translate([402.45, 200, 230])
		rotate([0, 90, 0])
		color([1, 1, 1])
		cylinder(20, d / 2, d / 2, true);
	translate([597.55, 200, 230])
		rotate([0, 90, 0])
		color([1, 1, 1])
		cylinder(20, d / 2, d / 2, true);
}

base();
rod_mount();
shell_mount();
rod();
shell();