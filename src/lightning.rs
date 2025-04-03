use rand::Rng;

#[repr(C)]
#[derive(Debug, Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct Lightning {
    position: [f32; 2],
    radius: f32,
    age: f32,
}

impl Lightning {
    pub fn new_random() -> Self {
        let mut rng = rand::rng();
        Self { position: [rng.random_range(-1.0..1.0), rng.random_range(-1.0..1.0)], radius: rng.random_range(2.0..20.0), age: rng.random_range(0.0..90.) }
    } 

    pub fn lightning_vec(element_count: u32) -> Vec<Self> {
        let mut res = Vec::new();
        for i in 0..element_count {
            res.push(Lightning::new_random());
        }
        res
    }
}

