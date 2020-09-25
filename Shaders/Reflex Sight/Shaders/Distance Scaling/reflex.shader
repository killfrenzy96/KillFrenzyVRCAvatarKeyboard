// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Transparent/Reflex Sight" {
	Properties {
		_reticleTex ("Reticle (RGB)", 2D) = "white" {}
		_reticleColour ("Reticle Colour", Color) = (1,1,1,1)
		_reticleBright ("Reticle Brightness", Range(0,1)) = 1
		_glassColour ("Glass Colour", Color) = (1,1,1,1)
		_glassTrans ("Glass Transparency", Range(0,1)) = 0.1
		_uvScale ("Reticle Scale", float) = 1
	}
	SubShader {
		Tags {"Queue"="transparent" "RenderType"="transparent" }
		
		CGPROGRAM
		#pragma surface surf Lambert alpha
		#include "UnityCG.cginc"

		sampler2D _reticleTex;
		float _uvScale, _glassTrans, _reticleBright;
		float4 _reticleColour, _glassColour;

		struct Input
		{
		  float3 worldPos;
		  float3 worldNormal;
		};
		
		void surf (Input IN, inout SurfaceOutput o) {		
			//project (camera - point) vector onto normal of surface
			float shortestDistanceToSurface = dot (_WorldSpaceCameraPos - IN.worldPos,IN.worldNormal);
			//get point on surface closest to camera
			float3 closestPoint = _WorldSpaceCameraPos - (shortestDistanceToSurface * IN.worldNormal);
			
			//take both current point and closest point to object space and get difference between them in xy plane
			//multiply by unit scale factor to get uv delta
			float2 uv_Delta = (mul((float3x3)unity_WorldToObject,IN.worldPos) - mul((float3x3)unity_WorldToObject,closestPoint)).xy * _uvScale;
			
			//sample texture using uv delta
			half4 col = tex2D(_reticleTex,(0.5f, 0.5f) + uv_Delta/shortestDistanceToSurface);
			
			o.Emission = (col.a * _reticleColour.rgb * _reticleBright);
			o.Albedo = max(col.a * _reticleColour.rgb, _glassTrans * _glassColour.rgb);
			o.Alpha = max(col.a, _glassTrans);
		}
		
		ENDCG
	}
}
