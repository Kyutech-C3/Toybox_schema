---
name: "service"
root: "."
output: "./proto/schema/{{ name }}"
ignore: []
questions:
    name: "service name(start with upper case)"
---

# `{{ inputs.name | lower }}/rpc/{{ inputs.name | lower }}.proto`

```
syntax = "proto3";

package proto.{{ inputs.name | lower }}.rpc;

import "proto/third_party/protoc-gen-openapiv2/options/annotations.proto";
import "proto/third_party/google/api/field_behavior.proto";

option go_package = "./";

message Get{{ inputs.name }}Response {
  string id = 1 [ (google.api.field_behavior) = REQUIRED ];
}
```

# `{{ inputs.name | lower  }}/resources/{{ inputs.name | lower  }}.proto`

```
syntax = "proto3";

package proto.{{ inputs.name | lower }}.resources;

option go_package = "./";

message {{ inputs.name }} {
  string id = 1;
}
```

# `{{ inputs.name | lower  }}/{{ inputs.name | lower  }}.proto`

```
syntax = "proto3";

package proto.{{ inputs.name | lower  }};

import "proto/{{ inputs.name }}/rpc/{{ inputs.name }}.proto";
import "proto/third_party/google/api/annotations.proto";

option go_package = "./";

service {{ inputs.name }}Service {
  rpc Get{{ inputs.name }}(google.protobuf.Empty)
      returns (proto.{{ inputs.name | lower}}.Get{{ inputs.name }}Response) {
    option (google.api.http) = {
      post : "/v1/{{ inputs.name | lower }}"
      body : "*"
    };
  };
}
```
