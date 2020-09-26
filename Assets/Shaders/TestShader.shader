// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/TestShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" }

		GrabPass {  }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 grabPos : TEXCOORD0;
			};

			v2f vert(float4 vertex : POSITION)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(vertex);
				o.grabPos = ComputeGrabScreenPos(o.pos);
				return o;
			}

			sampler2D _MainTex;
			sampler2D _GrabTexture;

			fixed4 frag(v2f i) : SV_Target
			{
				return tex2D(_GrabTexture, i.grabPos);
			}

			ENDCG
		}
    }
    FallBack "Diffuse"
}
