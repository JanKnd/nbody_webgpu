use nbody_webgpu::run;

fn main() {
    pollster::block_on(run());
}
