// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/TitleShader"
{
	Properties
	{
		_MainTex("MainTexture", 2D) = "white" {}
		_Color("Color (RGBA)", Color) = (1, 1, 1, 1)
	}

	Category
	{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Opaque" }

		SubShader
		{
			Cull Off ZWrite Off ZTest Always
			Blend SrcAlpha OneMinusSrcAlpha

			GrabPass
			{
				Tags{ "LightMode" = "Always" }
			}

			Pass
			{
				Tags{ "LightMode" = "Always" }

				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma fragmentoption ARB_precision_hint_fastest
				#include "UnityCG.cginc"

				struct appdata_t
				{
					float4 vertex : POSITION;
					float4 texcoord : TEXCOORD0;
				};

				struct v2f
				{
					float4 vertex : POSITION;
					float4 uvgrab : TEXCOORD0;
				};

				v2f vert(appdata_t v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.uvgrab = v.texcoord;
					return o;
				}

				sampler2D _GrabTexture;
				sampler2D _MainTex;
				float4 _Color;

				half4 frag(v2f i) : SV_Target
				{
					fixed4 col_main = tex2D(_MainTex, i.uvgrab);
					float weight = (col_main.r + col_main.g + col_main.b) / 3;

					fixed4 col_grab = tex2D(_GrabTexture, i.uvgrab);

					col_grab = 1 - sqrt(1 - col_grab * col_grab);
					col_grab.rgb = min(1, col_grab.rgb + 0.6f);
					col_main = float4(1, 1, 1, col_main.a) * _Color;
					
					return col_grab * weight + col_main * (1 - weight);
				}
				ENDCG
			}
		}
	}
}