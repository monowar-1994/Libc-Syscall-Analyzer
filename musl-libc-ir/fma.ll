; ModuleID = 'src/math/x86_64/fma.c'
source_filename = "src/math/x86_64/fma.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc { i64, i64 } @normalize(double noundef %0) #4
  %5 = extractvalue { i64, i64 } %4, 0
  %6 = extractvalue { i64, i64 } %4, 1
  %7 = tail call fastcc { i64, i64 } @normalize(double noundef %1) #4
  %8 = extractvalue { i64, i64 } %7, 0
  %9 = extractvalue { i64, i64 } %7, 1
  %10 = tail call fastcc { i64, i64 } @normalize(double noundef %2) #4
  %11 = extractvalue { i64, i64 } %10, 0
  %12 = extractvalue { i64, i64 } %10, 1
  %13 = trunc i64 %6 to i32
  %14 = icmp sgt i32 %13, 970
  %15 = trunc i64 %9 to i32
  %16 = icmp sgt i32 %15, 970
  %17 = select i1 %14, i1 true, i1 %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %3
  %19 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %1, double %2, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %214

20:                                               ; preds = %3
  %21 = trunc i64 %12 to i32
  %22 = icmp sgt i32 %21, 970
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = icmp eq i32 %21, 971
  br i1 %24, label %214, label %25

25:                                               ; preds = %23
  %26 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %1, double %2, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %214

27:                                               ; preds = %20
  %28 = and i64 %5, 4294967295
  %29 = lshr i64 %5, 32
  %30 = and i64 %8, 4294967295
  %31 = lshr i64 %8, 32
  %32 = mul nuw i64 %30, %28
  %33 = mul nuw i64 %31, %28
  %34 = mul nuw i64 %30, %29
  %35 = add i64 %33, %34
  %36 = mul nuw i64 %31, %29
  %37 = shl i64 %35, 32
  %38 = add i64 %37, %32
  %39 = lshr i64 %35, 32
  %40 = add nuw i64 %39, %36
  %41 = icmp ugt i64 %32, %38
  %42 = zext i1 %41 to i64
  %43 = add nuw i64 %40, %42
  %44 = add nsw i32 %15, %13
  %45 = sub nsw i32 %21, %44
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %47, label %73

47:                                               ; preds = %27
  %48 = icmp ult i32 %45, 64
  br i1 %48, label %49, label %55

49:                                               ; preds = %47
  %50 = zext i32 %45 to i64
  %51 = shl i64 %11, %50
  %52 = sub nuw nsw i32 64, %45
  %53 = zext i32 %52 to i64
  %54 = lshr i64 %11, %53
  br label %87

55:                                               ; preds = %47
  %56 = add nsw i32 %21, -64
  %57 = add nsw i32 %45, -64
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %87, label %59

59:                                               ; preds = %55
  %60 = icmp ult i32 %45, 128
  br i1 %60, label %61, label %87

61:                                               ; preds = %59
  %62 = sub nuw nsw i32 128, %45
  %63 = zext i32 %62 to i64
  %64 = shl i64 %43, %63
  %65 = zext i32 %57 to i64
  %66 = lshr i64 %38, %65
  %67 = shl i64 %38, %63
  %68 = icmp ne i64 %67, 0
  %69 = zext i1 %68 to i64
  %70 = or i64 %66, %69
  %71 = or i64 %70, %64
  %72 = lshr i64 %43, %65
  br label %87

73:                                               ; preds = %27
  %74 = sub nsw i32 0, %45
  %75 = icmp eq i32 %45, 0
  br i1 %75, label %87, label %76

76:                                               ; preds = %73
  %77 = icmp ugt i32 %45, -64
  br i1 %77, label %78, label %87

78:                                               ; preds = %76
  %79 = zext i32 %74 to i64
  %80 = lshr i64 %11, %79
  %81 = add nsw i32 %45, 64
  %82 = zext i32 %81 to i64
  %83 = shl i64 %11, %82
  %84 = icmp ne i64 %83, 0
  %85 = zext i1 %84 to i64
  %86 = or i64 %80, %85
  br label %87

87:                                               ; preds = %59, %76, %73, %78, %49, %61, %55
  %88 = phi i64 [ %43, %49 ], [ %43, %55 ], [ %72, %61 ], [ %43, %73 ], [ %43, %78 ], [ %43, %76 ], [ 0, %59 ]
  %89 = phi i64 [ %38, %49 ], [ %38, %55 ], [ %71, %61 ], [ %38, %73 ], [ %38, %78 ], [ %38, %76 ], [ 1, %59 ]
  %90 = phi i32 [ %44, %49 ], [ %56, %55 ], [ %56, %61 ], [ %44, %73 ], [ %44, %78 ], [ %44, %76 ], [ %56, %59 ]
  %91 = phi i64 [ %51, %49 ], [ 0, %55 ], [ 0, %61 ], [ %11, %73 ], [ %86, %78 ], [ 1, %76 ], [ 0, %59 ]
  %92 = phi i64 [ %54, %49 ], [ %11, %55 ], [ %11, %61 ], [ 0, %73 ], [ 0, %78 ], [ 0, %76 ], [ %11, %59 ]
  %93 = xor i64 %9, %6
  %94 = lshr i64 %93, 32
  %95 = trunc i64 %94 to i32
  %96 = lshr i64 %12, 32
  %97 = icmp eq i64 %94, %96
  br i1 %97, label %98, label %104

98:                                               ; preds = %87
  %99 = add i64 %91, %89
  %100 = icmp ult i64 %99, %91
  %101 = zext i1 %100 to i64
  %102 = add i64 %92, %88
  %103 = add i64 %102, %101
  br label %123

104:                                              ; preds = %87
  %105 = sub i64 %89, %91
  %106 = sub i64 %88, %92
  %107 = icmp ult i64 %89, %91
  %108 = sext i1 %107 to i64
  %109 = add i64 %106, %108
  %110 = icmp sgt i64 %109, -1
  br i1 %110, label %118, label %111

111:                                              ; preds = %104
  %112 = sub i64 0, %105
  %113 = icmp ne i64 %105, 0
  %114 = sext i1 %113 to i64
  %115 = sub i64 %114, %109
  %116 = icmp eq i32 %95, 0
  %117 = zext i1 %116 to i32
  br label %118

118:                                              ; preds = %104, %111
  %119 = phi i64 [ %109, %104 ], [ %115, %111 ]
  %120 = phi i64 [ %105, %104 ], [ %112, %111 ]
  %121 = phi i32 [ %95, %104 ], [ %117, %111 ]
  %122 = icmp eq i64 %119, 0
  br i1 %122, label %141, label %123

123:                                              ; preds = %98, %118
  %124 = phi i32 [ %95, %98 ], [ %121, %118 ]
  %125 = phi i64 [ %99, %98 ], [ %120, %118 ]
  %126 = phi i64 [ %103, %98 ], [ %119, %118 ]
  %127 = add nsw i32 %90, 64
  %128 = tail call i64 asm "bsr $1,$0 ; xor $$63,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %126) #6, !srcloc !3
  %129 = trunc i64 %128 to i32
  %130 = add nsw i32 %129, -1
  %131 = zext i32 %130 to i64
  %132 = shl i64 %126, %131
  %133 = sub i64 65, %128
  %134 = and i64 %133, 4294967295
  %135 = lshr i64 %125, %134
  %136 = or i64 %132, %135
  %137 = shl i64 %125, %131
  %138 = icmp ne i64 %137, 0
  %139 = zext i1 %138 to i64
  %140 = or i64 %136, %139
  br label %157

141:                                              ; preds = %118
  %142 = icmp eq i64 %120, 0
  br i1 %142, label %155, label %143

143:                                              ; preds = %141
  %144 = tail call i64 asm "bsr $1,$0 ; xor $$63,$0", "=r,r,~{dirflag},~{fpsr},~{flags}"(i64 %120) #6, !srcloc !3
  %145 = trunc i64 %144 to i32
  %146 = add nsw i32 %145, -1
  %147 = icmp slt i32 %145, 1
  br i1 %147, label %148, label %152

148:                                              ; preds = %143
  %149 = lshr i64 %120, 1
  %150 = and i64 %120, 1
  %151 = or i64 %149, %150
  br label %157

152:                                              ; preds = %143
  %153 = zext i32 %146 to i64
  %154 = shl i64 %120, %153
  br label %157

155:                                              ; preds = %141
  %156 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %0, double %1, double %2, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %214

157:                                              ; preds = %152, %148, %123
  %158 = phi i32 [ %121, %148 ], [ %121, %152 ], [ %124, %123 ]
  %159 = phi i64 [ %151, %148 ], [ %154, %152 ], [ %140, %123 ]
  %160 = phi i32 [ %90, %148 ], [ %90, %152 ], [ %127, %123 ]
  %161 = phi i32 [ %146, %148 ], [ %146, %152 ], [ %130, %123 ]
  %162 = sub nsw i32 %160, %161
  %163 = icmp eq i32 %158, 0
  %164 = sub nsw i64 0, %159
  %165 = select i1 %163, i64 %159, i64 %164
  %166 = tail call double @llvm.experimental.constrained.sitofp.f64.i64(i64 %165, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %167 = icmp slt i32 %162, -1084
  br i1 %167, label %168, label %211

168:                                              ; preds = %157
  %169 = icmp eq i32 %162, -1085
  br i1 %169, label %170, label %202

170:                                              ; preds = %168
  %171 = select i1 %163, double 0x43E0000000000000, double 0xC3E0000000000000
  %172 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %166, double %171, metadata !"oeq", metadata !"fpexcept.strict") #5
  br i1 %172, label %193, label %173

173:                                              ; preds = %170
  %174 = and i64 %159, 2047
  %175 = icmp eq i64 %174, 0
  br i1 %175, label %211, label %176

176:                                              ; preds = %173
  %177 = lshr i64 %159, 1
  %178 = and i64 %159, 1
  %179 = or i64 %178, %177
  %180 = or i64 %179, 4611686018427387904
  %181 = sub nsw i64 0, %180
  %182 = select i1 %163, i64 %180, i64 %181
  %183 = tail call double @llvm.experimental.constrained.sitofp.f64.i64(i64 %182, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %184 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %185 = fneg double %171
  %186 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %184, double %183, double %185, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %187 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3810000000000000, metadata !"fpexcept.strict") #5
  %188 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x10000000000000, double %187, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %189 = tail call double @llvm.experimental.constrained.fmul.f64(double %188, double %186, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %190 = tail call double @llvm.experimental.constrained.fmul.f64(double %189, double %189, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %191 = tail call double @llvm.experimental.constrained.fsub.f64(double %186, double %186, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %192 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %190, double %191, double %186, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %211

193:                                              ; preds = %170
  %194 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3810000000000000, metadata !"fpexcept.strict") #5
  %195 = tail call double @llvm.experimental.constrained.fmul.f64(double 0x3BFFFFFFF0000000, double %194, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %196 = tail call double @llvm.experimental.constrained.fmul.f64(double %195, double %166, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %197 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %196, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %198 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float 0x3810000000000000, metadata !"fpexcept.strict") #5
  %199 = tail call double @llvm.experimental.constrained.fdiv.f64(double 0x10000000000000, double %198, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  %200 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %197, metadata !"fpexcept.strict") #5
  %201 = tail call double @llvm.experimental.constrained.fmul.f64(double %199, double %200, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %214

202:                                              ; preds = %168
  %203 = and i64 %159, 1023
  %204 = icmp eq i64 %203, 0
  %205 = select i1 %204, i64 0, i64 1024
  %206 = and i64 %159, -1024
  %207 = or i64 %205, %206
  %208 = sub nsw i64 0, %207
  %209 = select i1 %163, i64 %207, i64 %208
  %210 = tail call double @llvm.experimental.constrained.sitofp.f64.i64(i64 %209, metadata !"round.dynamic", metadata !"fpexcept.strict") #5
  br label %211

211:                                              ; preds = %176, %173, %202, %157
  %212 = phi double [ %210, %202 ], [ %166, %157 ], [ %166, %173 ], [ %192, %176 ]
  %213 = tail call double @scalbn(double noundef %212, i32 noundef %162) #7
  br label %214

214:                                              ; preds = %155, %211, %193, %23, %25, %18
  %215 = phi double [ %19, %18 ], [ %26, %25 ], [ %2, %23 ], [ %156, %155 ], [ %213, %211 ], [ %201, %193 ]
  ret double %215
}

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal fastcc { i64, i64 } @normalize(double noundef %0) unnamed_addr #1 {
  %2 = bitcast double %0 to i64
  %3 = lshr i64 %2, 52
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 2047
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %16

7:                                                ; preds = %1
  %8 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double 0x43E0000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %9 = bitcast double %8 to i64
  %10 = lshr i64 %9, 52
  %11 = trunc i64 %10 to i32
  %12 = and i32 %11, 2047
  %13 = icmp eq i32 %12, 0
  %14 = add nsw i32 %12, -63
  %15 = select i1 %13, i32 2048, i32 %14
  br label %16

16:                                               ; preds = %7, %1
  %17 = phi i32 [ %5, %1 ], [ %15, %7 ]
  %18 = phi i64 [ %2, %1 ], [ %9, %7 ]
  %19 = shl i64 %18, 1
  %20 = and i64 %19, 9007199254740990
  %21 = or i64 %20, 9007199254740992
  %22 = add nsw i32 %17, -1076
  %23 = insertvalue { i64, i64 } poison, i64 %21, 0
  %24 = shl nuw nsw i64 %3, 32
  %25 = and i64 %24, 8796093022208
  %26 = zext i32 %22 to i64
  %27 = or i64 %25, %26
  %28 = insertvalue { i64, i64 } %23, i64 %27, 1
  ret { i64, i64 } %28
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i64(i64, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare double @scalbn(double noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { strictfp }
attributes #6 = { nounwind readnone strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 78612}
