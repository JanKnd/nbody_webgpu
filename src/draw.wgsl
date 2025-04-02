

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
    let center = vec2<f32>(800.0, 600.0);
    let frag_center = vec2<f32>()
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
}
