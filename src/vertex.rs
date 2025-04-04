use core::f32;

pub const VERTICES: &[Vertex] = &[
    Vertex {
        position: [-0.5, 0.5],
        color: [1.0, 1.0, 1.0],
    },
    Vertex {
        position: [-0.5, -0.5],
        color: [1.0, 1.0, 1.0],
    },
    Vertex {
        position: [0.5, -0.5],
        color: [1.0, 1.0, 1.0],
    },
    Vertex {
        position: [0.5, 0.5],
        color: [1.0, 1.0, 1.0],
    },
];

pub const INDICES: &[u16] = &[0, 1, 2, 0, 2, 3];

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct Vertex {
    position: [f32; 2],
    color: [f32; 3],
}

impl Vertex {
    const ATTRIBS: [wgpu::VertexAttribute; 2] =
        wgpu::vertex_attr_array![0 => Float32x2, 1 => Float32x3];

    pub fn desc() -> wgpu::VertexBufferLayout<'static> {
        wgpu::VertexBufferLayout {
            array_stride: std::mem::size_of::<Vertex>() as wgpu::BufferAddress,
            step_mode: wgpu::VertexStepMode::Vertex,
            attributes: &Self::ATTRIBS,
        }
    }
}
