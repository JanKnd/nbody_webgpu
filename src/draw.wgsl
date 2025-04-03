struct Lightning {
    position: vec2<f32>,
    radius: f32,
    age: f32,
}

struct Scene {
    width: u32,
    height: u32,
}

@group(0) @binding(0) var<uniform> scene: Scene;
@group(0) @binding(1) var<storage, read> lightning_data: array<Lightning>;

@vertex
fn vs_main(@builtin(vertex_index) index : u32) -> @builtin(position) vec4<f32> {
    var positions = array<vec2<f32>, 3>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>( 3.0, -1.0),
        vec2<f32>(-1.0,  3.0)
    );
    return vec4<f32>(positions[index], 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) fragCoord: vec4<f32>) -> @location(0) vec4<f32> {
    const COLORS = array<vec3f, 6>(
        vec3<f32>(1., 1., 0.,),
        vec3<f32>(0.827, 0.612, 1.,),
        vec3<f32>(0.827, 0.47, 0.,),
        vec3<f32>(0.749, 0.274, 0.,),
        vec3<f32>(0.667, 0.127, 0.,),
        vec3<f32>(0.51, 0., 0.,),
    );

    for (var i = 0; i < i32(arrayLength(&lightning_data)); i++) {
        let center = vec2<f32>((lightning_data[i].position[0] + 1.) * 0.5 * f32(scene.width), (lightning_data[i].position[1] + 1.) * 0.5 * f32(scene.height),); 
        if distance(fragCoord.xy, center) < lightning_data[i].radius {
            return vec4<f32>(COLORS[get_color_index(lightning_data[i].age)], 1.);
        }
        else { continue; }
    }
    return vec4<f32>(0., 0., 0., 1.);
    
    /*
    let pos = vec2<f32>(0.0, 0.0);
    //let center = vec2<f32>(f32(scene.width) / 2., f32(scene.height) / 2.);
    
    let frag_center = vec2<f32>();
    let radius = 100.0;
    let edge_width = 20.0;
    let dist = distance(fragCoord.xy, center);
    
    
    /*
    if dist < radius {
        return vec4<f32>(1.0, 1.0, 1.0, 1.0);
    } else {
        return vec4<f32>(0.0, 0.0, 0.0, 1.0);
    }
    */

    //solid yellow
    /*
    if dist < radius {
        return vec4<f32>(1.,1.,0.,1.);
    }
    else {
        return vec4<f32>(0.0, 0.0, 0.0, 0.0);
    }
    */

    //yellow with red outline
    if dist < (radius - 20.) {
        return vec4<f32>(1.,1.,0.,1.);
    } else if dist < radius { 
        return vec4<f32>(1., 0., 0., 1.);
    } else {
        return vec4<f32>(0.0, 0.0, 0.0, 0.0);
    }
    */
}

fn get_color_index(age: f32) -> u32 {
    return u32(age / 18);
}